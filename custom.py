from cfengine import PromiseModule, ValidationError, Result


class CustomPromiseTypeModule(PromiseModule):
    def __init__(self, **kwargs):
        super().__init__("custom_promise_module", "0.0.1", **kwargs)

    def validate_promise(self, promiser, attributes, meta):
        for name, value in attributes.items():
            if name != "outcome":
                raise ValidationError(
                    f"Unknown attribute '{name}' in custom promise with promiser '{promiser}'"
                )
            supported = ("kept", "repaired", "not-kept")
            if value.lower() not in supported:
                raise ValidationError(
                    f"Invalid value '{value}' for attribute '{name}' in custom promise with promiser '{promiser}': Value must be one of [{'/'.join(supported)}]"
                )

    def evaluate_promise(self, promiser, attributes, meta):
        outcome = attributes["outcome"].lower()
        if outcome == "kept":
            self.log_info(f"Promise kept for custom promise with promiser {promiser}")
            return Result.KEPT
        elif outcome == "repaired":
            self.log_info(
                f"Promise repaired for custom promise with promiser {promiser}"
            )
            return Result.REPAIRED
        self.log_error(f"Promise not kept for custom promise with promiser {promiser}")
        return Result.NOT_KEPT


if __name__ == "__main__":
    CustomPromiseTypeModule().start()
